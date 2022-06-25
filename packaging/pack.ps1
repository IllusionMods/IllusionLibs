
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

Pack "AIGirl" "2020.05.29.4" "2018.2.21.4"
Pack "AIShoujo" "2019.12.20.4" "2018.2.21.4"
Pack "EmotionCreators" "2019.6.6.4" "2017.4.24.4"
Pack "Koikatu" "2019.4.27.4" "5.6.2.4"
Pack "KoikatsuParty" "2019.4.27.4" "5.6.2.4"
Pack "PlayHome" "2018.3.11.4" "5.5.5.4"
Pack "VRKanojo" "2021.1.13.4" "5.4.5.4"
Pack "HoneySelect" "2017.6.30.2" "5.3.5.2"
Pack "HoneySelect2" "2020.05.29.4" "2018.4.11.4"
Pack "KoikatsuSunshine" "2021.09.17.0" "2019.4.9.0"
Pack "KoikatsuSunshineVR" "2021.09.21.0" "2019.4.9.0"
Pack "SexyBeachPR" "2015.12.18.0" "4.6.7.0"
Pack "XUnity" "" ""
Pack "BepInEx" "" ""
