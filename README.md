# NIRx-FileNameChanger
 
NIRx automatically genrates and labels the NIRS files, and there are refrences inside some of the filse, to the name of another file. So, by simpling renaming the files, the files wont be readable to NIRS libraries anymore. 

This code can be used to rename the file names, and properly changing the refrences inside each file, without replacing the original file names and structures.

---
## How To

The prototype of the function is as follow:

```Matlab
Function NIRx_ChangeFileName(pathRootFolder,newFileName);
```
Both input arguments are optional, and if are not passed, a GUI popup will ask for a proper inputs.

```
pathRootFolder: The pass to the root folder of NIRS data.
```
```
newFileName:    The new file name.
```

---
## Examples

With both inputs:
```
NIRx_ChangeFileName('C:\NIRx\Data\Today\', 'P01_ExperimentX_ConditionA');
```

With an static address and input dialog for new file name:
```
NIRx_ChangeFileName('C:\NIRx\Data\Today\');
```

With an open folder dialog for getting path to the data folder and an input dialog for new file name:
```
NIRx_ChangeFileName();
```

--- 

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**