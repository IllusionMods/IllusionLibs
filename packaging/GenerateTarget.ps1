param([string]$id, [string]$savePath)

$xml = [xml](Get-Content ".\template.targets")
$xml.Project.Target.Name = $id.Replace('.', '')
$xml.Project.Target.ItemGroup.ReferenceCopyLocalPaths.Condition = "'%(ReferenceCopyLocalPaths.NuGetPackageId)' == '$($id)'"
$xml.Save([IO.Path]::Combine($savePath, $id + ".targets"))
