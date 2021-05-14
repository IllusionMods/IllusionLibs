param($installPath, $toolsPath, $package, $project)
$asms = $package.AssemblyReferences | %{$_.Name} 
foreach ($reference in $project.Object.References) 
{
    if ($asms -contains $reference.Name + ".dll") 
    {
        $reference.CopyLocal = $false;
    }
}

# Set the "Allow unsafe code" flag in all project configurations
# Needed to allow the code calling publicized assemblies to work
for($i = 1; $i -le $project.ConfigurationManager.Count; $i++)  
{ 
    $project.ConfigurationManager.Item($i).Properties.Item("AllowUnsafeBlocks").Value = "True"
}
# Save to make sure the change doesn't get lost
$project.Save()