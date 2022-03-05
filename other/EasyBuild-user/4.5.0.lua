help([==[

Description
===========
Local user EasyBuild module file.


More information
================
 - Homepage: https://easybuild.io/
]==])

whatis([==[Description: 
    EasyBuild is used to install softwares.
]==])
whatis([==[Homepage: https://easybuild.io/]==])

-- Main path for external repositories, for EasyBuild installation path and for EasyBuild
local cpe = "/pdc/software/" .. os.getenv("CRAY_PE_VERSION") .. "/"
local repos = "/pdc/software/eb_repo/"
local root = cpe .. "other/easybuild/4.5.0/"
local local_user = os.getenv("HOME") .. "/.local/easybuild/"

-- Local paths
local lumi_software = repos .. "LUMI-SoftwareStack/easybuild/"
local pdc_software = repos .. "PDC-SoftwareStack/easybuild/"

prepend_path("PATH", pathJoin(root, "bin"))
prepend_path("PYTHONPATH", pathJoin(root, "lib/python3.6/site-packages/"))
append_path("EASYBUILD_ROBOT_PATHS", pathJoin(pdc_software, "easyconfigs"))
append_path("EASYBUILD_ROBOT_PATHS", pathJoin(lumi_software, "easyconfigs"))
append_path("EASYBUILD_ROBOT_PATHS", pathJoin(repos, "LUMI-EasyBuild-contrib/easybuild/easyconfigs"))
append_path("EASYBUILD_ROBOT_PATHS", pathJoin(repos, "CSCS-production/easybuild/easyconfigs"))
setenv("EASYBUILD_REPOSITORYPATH", repos)
setenv("EASYBUILD_INCLUDE_EASYBLOCKS", lumi_software .. "easyblocks/*/*.py")
setenv("EASYBUILD_INCLUDE_TOOLCHAINS", lumi_software .. "toolchains/*.py," .. lumi_software .. "toolchains/compiler/*.py")
setenv("EB_PYTHON", "python3")
setenv("EASYBUILD_OPTARCH", "x86-rome")
setenv("EASYBUILD_MODULE_SYNTAX", "Lua")
setenv("EASYBUILD_MODULES_TOOL", "Lmod")
setenv("EASYBUILD_MODULE_DEPENDS_ON", "False")
setenv("EASYBUILD_MODULE_EXTENSIONS", "True")
setenv("EASYBUILD_PARALLEL","64")
setenv("EASYBUILD_RECURSIVE_MODULE_UNLOAD", "False")
setenv("EASYBUILD_INSTALLPATH", local_user)
setenv("EASYBUILD_SOURCEPATH", pathJoin(local_user, "sources"))
append_path("MODULEPATH", pathJoin(local_user, "modules/all/"))
setenv("EASYBUILD_BUILDPATH", "/tmp")
