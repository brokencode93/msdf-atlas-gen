include "msdfgen"

project "msdf-atlas-gen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
 	staticruntime "off"

	targetdir (buildbindir .. "/%{prj.name}")
	objdir  (buildintdir .. "/%{prj.name}")

	files
	{
		"msdf-atlas-gen/**.h",
    	"msdf-atlas-gen/**.hpp",
    	"msdf-atlas-gen/**.cpp"
	}

	includedirs
	{
		"msdf-atlas-gen",
		"msdfgen",
		"msdfgen/include"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	links
	{
		"msdfgen"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		optimize "off"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
		symbols "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        	symbols "off"
