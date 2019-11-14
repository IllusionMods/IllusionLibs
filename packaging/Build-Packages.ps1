gci -Path AIGirl -Filter *.nuspec | foreach { nuget pack $_.FullName -version "2019.11.8" -properties id=IllusionLibs.AIGirl.$($_.BaseName) }
gci -Path EmotionCreators -Filter *.nuspec | foreach { nuget pack $_.FullName -version "2019.6.6" -properties id=IllusionLibs.EmotionCreators.$($_.BaseName) }
gci -Path Koikatu -Filter *.nuspec | foreach { nuget pack $_.FullName -version "2019.4.27" -properties id=IllusionLibs.Koikatu.$($_.BaseName) }
gci -Path PlayHome -Filter *.nuspec | foreach { nuget pack $_.FullName -version "2018.3.11" -properties id=IllusionLibs.PlayHome.$($_.BaseName) }
gci -Path HoneySelect -Filter *.nuspec | foreach { nuget pack $_.FullName -version "2017.6.30" -properties id=IllusionLibs.HoneySelect.$($_.BaseName) }
gci -Path XUnity -Filter *.nuspec | foreach { nuget pack $_.FullName -version "4.6.4" -properties id=IllusionLibs.XUnity.$($_.BaseName) }
gci -Path BepInEx -Filter *.nuspec | foreach { nuget pack $_.FullName -version "5.0.0" -properties id=IllusionLibs.BepInEx.$($_.BaseName) }
