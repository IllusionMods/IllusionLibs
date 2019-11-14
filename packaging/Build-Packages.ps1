gci -Path AIGirl -Filter *.nuspec | foreach { nuget pack $_.FullName -properties "id=IllusionLibs.AIGirl.$($_.BaseName);gameVersion=2019.11.8;unityVersion=2018.2.21.10560245" }
gci -Path EmotionCreators -Filter *.nuspec | foreach { nuget pack $_.FullName -properties "id=IllusionLibs.EmotionCreators.$($_.BaseName);gameVersion=2019.6.6;unityVersion=notset" }
gci -Path Koikatu -Filter *.nuspec | foreach { nuget pack $_.FullName -properties "id=IllusionLibs.Koikatu.$($_.BaseName);gameVersion=2019.4.27;unityVersion=5.6.2.10654012" }
gci -Path PlayHome -Filter *.nuspec | foreach { nuget pack $_.FullName -properties "id=IllusionLibs.PlayHome.$($_.BaseName);gameVersion=2018.3.11;unityVersion=5.5.5.14185958" }
gci -Path HoneySelect -Filter *.nuspec | foreach { nuget pack $_.FullName-properties "id=IllusionLibs.HoneySelect.$($_.BaseName);gameVersion=2017.6.30;unityVersion=notset" }
gci -Path XUnity -Filter *.nuspec | foreach { nuget pack $_.FullName -properties "id=IllusionLibs.XUnity.$($_.BaseName)" }
gci -Path BepInEx -Filter *.nuspec | foreach { nuget pack $_.FullName -properties "id=IllusionLibs.BepInEx.$($_.BaseName)" }
