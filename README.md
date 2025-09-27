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

## How to prevent dll files from these packages from being copied to the build output
If you want to keep your build directory clean with only the plugin dlls being copied there, you can use one of the following methods to prevent dlls from nuget packages from being copied there.

### By editing .csproj
Open your project in VisualStudio or similar and find it in the Solution Explorer, then:

- For old format .csproj files
    - Expand References
    - Select all of them (except for the Analyzers element if it exists)
    - Go to the Properties window
    - In "Copy Local" type in "False"
- For new format .csproj files (sdk)
    - Expand Dependencies\Packages
    - Select all of the packages (except for analyzers if any)
    - Go to the Properties window
    - In "Included Assets" type in "compile" and in "Private Assets" type in "All"

Finally, manually delete the dlls from your build output. Now whenever you build your project the package dlls should no longer get copied to the build directory.

### By using Directory.Build.props
Add this section to Directory.Build.props. Warning: The SkipAllRefs target will prevent **all** package references from being copied. RemoveDepsJson target will remove the `*.deps.json` files from build output since they are not needed for BepInEx plugins.
```xml
<Project>
	<Target Name="SkipAllRefs" AfterTargets="ResolveReferences">
		<ItemGroup>
			<ReferenceCopyLocalPaths Remove="@(ReferenceCopyLocalPaths)" />
		</ItemGroup>
	</Target>

	<Target Name="RemoveDepsJson" AfterTargets="PostBuildEvent">
		<Delete Files="$(OutputPath)\$(MSBuildProjectName).deps.json" />
	</Target>
</Project>
```

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
