
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

# Game name, Game assembly version, Unity assembly version
Pack "AIGirl" "2020.05.29.5" "2018.2.21.4"
Pack "AIShoujo" "2022.06.20.1" "2018.2.21.4"
Pack "EmotionCreators" "2019.6.6.4" "2017.4.24.4"
Pack "Koikatu" "2019.4.27.4" "5.6.2.4"
Pack "KoikatsuParty" "2021.03.25.0" "5.6.2.4"
Pack "PlayHome" "2018.3.11.4" "5.5.5.4"
Pack "VRKanojo" "2021.1.13.4" "5.4.5.4"
Pack "HoneySelect" "2017.6.30.2" "5.3.5.2"
Pack "HoneySelect2" "2020.05.29.5" "2018.4.11.4"
Pack "HoneySelect2Libido" "2020.06.03.0" "2018.4.11.4"
Pack "KoikatsuSunshine" "2021.09.17.0" "2019.4.9.0"
Pack "KoikatsuSunshineVR" "2021.09.21.0" "2019.4.9.0"
Pack "SexyBeachPR" "2015.12.18.0" "4.6.7.0"
Pack "KoiKoiLB" "2023.05.27.2" "2021.3.18.2"
Pack "HoneyCome" "2023.99.12.15" "2021.3.14.3"
Pack "HoneyComeStudio" "2023.101.12.22" "2021.3.14.3"
Pack "RoomGirl" "2023.02.10.0" "2020.3.33.0"
Pack "SamabakeScramble" "2024.08.30.1" "2021.3.33.1"
Pack "Aicomi" "2024.10.03.0" "2022.3.55.1"
Pack "DigitalCraft" "2025.11.21.0" "2022.3.55.0"
Pack "XUnity" "" ""
Pack "BepInEx" "" ""
