$p = Get-Process  | Out-String
$arr=$p.Split([Environment]::NewLine)
$hash = [ordered]@{}
$firstLine = [bool]0;

foreach($process in $arr)
    {
    if($firstLine){
    $firstLIne=[bool]1
    continue
    }

$key = $($process -replace '\s+', ' ').Split(" ")[$($process -replace '\s+', ' ').Split(" ").length-4]
$val = $($process -replace '\s+', ' ').Split(" ")[$($process -replace '\s+', ' ').Split(" ").length-2]
if($key){
try {
$hash.Add($key, $val)
}catch{}
}
}
foreach($item in $hash.GetEnumerator() | Sort Name)

{

echo "ID: $($item.Name) Process $($item.Value)"

}
#$hash

Write-Host -Object ('The key that was pressed was: {0}' -f [System.Console]::ReadKey().Key.ToString());