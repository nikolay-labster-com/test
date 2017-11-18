$ErrorActionPreference = "Stop"

clear
git fetch

function EnsureNotNull($text){
    if ([String]::IsNullOrWhiteSpace($text)){
        throw "Value is null.";
    }
}

function GetCurrentBranchName(){
    $branch_line = git branch | select-string -pattern '\* .+';
    $branch = [regex]::match($branch_line,'\* (?<br>[\w\d]+)').Groups["br"].Value
    EnsureNotNull($branch);
    return $branch;
}
function GetFutureBranches($currentBranchName){
    $lstCommitsRaw = git log --remotes --reverse --format="%H %cI" --ancestry-path HEAD..$currentBranchName
    $arr = [System.Collections.ArrayList]@();
    foreach($oneLine in $lstCommitsRaw){
        $m = [regex]::match($oneLine,'(?<commit>[\w\d]{40}) (?<date>\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\+\d{2}:\d{2})');
        if (-not $m.Success){
            throw "Could not parse '$oneLine'"
        }
        $item = @{};
        $item.commit = $m.Groups["commit"].Value;
        $item.dt = $m.Groups["date"].Value;
        $arr += , $item;
    }
    return $arr;
}

#git log --all --reverse --pretty=oneline HEAD..master

#git merge --ff-only


$arr = GetFutureBranches(GetCurrentBranchName)
echo "there are $($arr.Length) commits to download"

$ErrorActionPreference = "Continue"

function GitMerge($commit){
    #write-host $commit
    git merge --ff-only $commit
    $lastCode = $LastExitCode
    write-host "Last exit code $lastCode"
    return $lastCode
}

foreach($item in $arr){
    do {
        write-host "downloading $($item.commit) date $($item.dt)"
        git reset --hard
        git clean -fd
        git merge --ff-only $commit
        $gitrez = $LastExitCode
        write-host "Last exit code $gitrez"
    } while ($gitrez -ne 0);
}




