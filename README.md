# IllusionLibs
Every library ever needed for Illusion game modding, almost.

## How to use IllusionLibs in your project
1. Create a new `nuget.config` file next to your .sln file.
2. Put this inside the newly created file:
```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <packageRestore>
        <add key="enabled" value="True" />
        <add key="automatic" value="True" />
    </packageRestore>
    <packageSources>
        <add key="IllusionMods" value="https://pkgs.dev.azure.com/IllusionMods/Nuget/_packaging/IllusionMods/nuget/v3/index.json" />
    </packageSources>
</configuration>
```
3. Close and reopen your solution if you had it open in VS.
4. Right click on your project and "Manage NuGet packages..."
5. Change "Package source" on right to "IllusionMods" and turn on "Include prerelease" toggle. You should now see all of the packages from this repository (and more).

## How to update nuget packages
1. Clone the repo
2. Use the included mono-cil-strip.exe to strip the new assemblies of their code
   - `strip-folder.bat` is used by dragging a folder on it
   - `mono-cil-strip.exe` is used by dragging a file on it
3. Replace the dll files you want to update with the new versions in the `packaging\GAME\libraries` folder
4. Update the nuget version
   - Game and unity package versions are defined in the `.github\workflows\nuget.yml` file
   - Some other packages have the version in the nuspec file directly
5. Commit your changes and the github action will automatically push the updated packages to the nuget feed
