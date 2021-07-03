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
5. Change "Package source" on right to "IllusionMods". You should now see all of the packages from this repository (and more).

## How to update nuget packages in this repository
This is necessary only if you want to update or add new dlls to this repository. To do that you will have to prepare the dlls and update nuspec files.
1. Clone the repo
2. Use the included mono-cil-strip.exe to strip the new assemblies of their code and publicize them (make all members public for easier access, your project has to be set to unsafe for it to work, the packages all contain a script that sets this flag automatically when installed)
   - `strip-folder.bat` is used by dragging a folder on it
   - `strip-dlls-folder.sh` (Linux) is used by running it to strip contents of the dlls folder
   - `mono-cil-strip.exe` is used by dragging a file on it
3. Replace the dll files you want to update with the new versions in the `packaging\GAME\libraries` folder
4. Update the nuget version
   - Game and unity package versions are defined in the `packaging\pack.ps1` file
   - Some other packages have the version in the nuspec file directly
5. Commit your changes and the github action will automatically push the updated packages to the nuget feed
