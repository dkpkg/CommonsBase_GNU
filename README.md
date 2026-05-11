# CommonsBase_GNU

## Testing and updating distribution scripts

```sh
./dk0 update
# Darwin
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Darwin_arm64 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Darwin_arm64.u
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Darwin_x86_64 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Darwin_x86_64.u

# Linux
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Linux_x86 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Linux_x86.u
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Linux_x86_64 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Linux_x86_64.u
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Linux_arm64 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Linux_arm64.u

# Windows
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Windows_x86 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Windows_x86.u
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Windows_x86_64 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Windows_x86_64.u
./dk0 -nosysinc --verbose distribute CommonsBase_GNU-dist-Windows_arm64 --library 'CommonsBase_GNU@2.5.999911122233' --actual-in-place dist-Windows_arm64.u
```

## Using docker to update distribution scripts

```sh
rm -rf t # or in PowerShell: del -Force -Recurse .\t\

docker run -v .:/work -v MlFrontXBuildLinux:/work/t --workdir /work -it quay.io/pypa/manylinux_2_28_x86_64:latest sh ./dk0 -nosysinc -v -v distribute CommonsBase_GNU-dist-Linux_x86_64 --library CommonsBase_GNU@2.5.999911122233 --actual-in-place dist-Linux_x86_64.u
docker run -v .:/work -v MlFrontXBuildLinux:/work/t --workdir /work -it quay.io/pypa/manylinux_2_28_i686:latest sh ./dk0 -nosysinc -v -v distribute CommonsBase_GNU-dist-Linux_x86 --library CommonsBase_GNU@2.5.999911122233 --actual-in-place dist-Linux_x86.u
```

## Updating dk0 and dk0.cmd scripts

On Windows PowerShell (from the root of this repository):

```powershell
$ErrorActionPreference = "Stop"

$tmp = Join-Path $env:TEMP ("dk-" + [guid]::NewGuid().ToString())
git clone --depth 1 https://github.com/diskuv/dk.git $tmp

Copy-Item (Join-Path $tmp "dk0") -Destination ".\dk0" -Force
Copy-Item (Join-Path $tmp "dk0.cmd") -Destination ".\dk0.cmd" -Force

$dkVer = (Select-String -Path (Join-Path $tmp "dk0.cmd") -Pattern 'SET DK_VER=(.+)').Matches[0].Groups[1].Value.Trim()

Remove-Item $tmp -Recurse -Force

git commit -m "dk0 $dkVer" -- .\dk0 .\dk0.cmd
```
