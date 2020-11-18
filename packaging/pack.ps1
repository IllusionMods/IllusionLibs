
function GenerateTarget {
    param([string]$id, [string]$savePath)

    $xml = [xml](Get-Content ".\template.targets")
    $xml.Project.Target.Name = $id.Replace('.', '')
    $xml.Project.Target.ItemGroup.ReferenceCopyLocalPaths.Condition = "'%(ReferenceCopyLocalPaths.NuGetPackageId)' == '$($id)'"
    $xml.Save([IO.Path]::Combine($savePath, $id + ".targets"))
}

function Pack {
    param([string]$game, [string]$gameVersion, [string]$unityVersion)

    gci -Path $game -Filter *.nuspec | foreach {
        $id = "IllusionLibs.$($game).$($_.BaseName)"
        GenerateTarget $id $_.DirectoryName
        nuget pack $_.FullName -properties "id=$($id);gameVersion=$($gameVersion);unityVersion=$($unityVersion)";
    }
}

Pack "AIGirl" "2020.05.29.2" "2018.2.21.3"
Pack "AIShoujo" "2019.12.20.2" "2018.2.21.3"
Pack "EmotionCreators" "2019.6.6.2" "2017.4.24.3"
Pack "Koikatu" "2019.4.27.2" "5.6.2.2"
Pack "KoikatsuParty" "2019.4.27.2" "5.6.2.2"
Pack "PlayHome" "2018.3.11.2" "5.5.5.2"
Pack "HoneySelect" "2017.6.30.2" "5.3.5.2"
Pack "HoneySelect2" "2020.05.29.2" "2018.4.11.2"
Pack "XUnity" "" ""
Pack "BepInEx" "" ""
