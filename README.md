# IllusionLibs
Every library ever needed for Illusion game modding, almost.
 
## How to update nuget packages
1. Clone the repo
2. Replace the dll files you want to update with the new versions
3. Use the included mono-cil-strip.exe to strip the new assemblies of their code
4. Update the nuget version
   - Game and unity package versions are defined in the `.github\workflows\nuget.yml` file
   - Some other packages have the version in the nuspec file directly
5. Commit your changes and the github action will automatically push the updated packages to the nuget feed
