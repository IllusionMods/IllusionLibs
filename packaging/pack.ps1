
function GenerateTarget {
    param([string]$id, [string]$savePath)

    $xml = [xml](Get-Content ".\template.targets")
    $xml.Project.Target.Name = $id.Replace('.', '')
    $xml.Project.Target.ItemGroup.ReferenceCopyLocalPaths.Condition = "'%(ReferenceCopyLocalPaths.NuGetPackageId)' == '$($id)'"
    $xml.Save([IO.Path]::Combine($savePath, $id + ".targets"))
}

function Pack {
    param([string]$game, [string]$gameVer, [string]$unityVer)

    gci -Path $game -Filter *.nuspec | foreach {
        $id = "IllusionLibs.$($game).$($_.BaseName)"
        GenerateTarget $id $_.DirectoryName
        nuget pack $_.FullName -properties "id=$($id);gameVersion=$($gameVer);unityVersion=$($unityVer)";
    }
}

Pack "AIGirl" "2020.05.29.2" "2018.2.21.3"
Pack "AIShoujo" "2019.12.20.2" "5.5.5.2"
Pack "EmotionCreators" "2019.6.6.2" "5.5.5.2"
Pack "Koikatu" "2019.4.27.2" "5.5.5.2"
Pack "KoikatsuParty" "2019.4.27.2" "5.5.5.2"
Pack "PlayHome" "2018.3.11.2" "5.5.5.2"
Pack "HoneySelect" "2017.6.30.2" "5.5.5.2"
Pack "HoneySelect2" "2020.05.29.2" "5.5.5.2"
Pack "XUnity" "" ""
Pack "BepInEx" "" ""
