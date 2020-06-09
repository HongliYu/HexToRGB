# HexToRGB

A command line tool to convert Hex to RGB via batch processing.

There are online-web-apps to convert this Hex values for free, but too many ads, and the worst is only one input param can be accepted at a time. Thereby, a small tool is created to optimize efficiency.

## Install
1.  Xcode: Build the project with “cmd+b”
After that, user is able to run it by code “HexToRGB” in terminal
2.  Manually: Under HexToRGB directory
`swiftc *.swift`
User will get an executable file called “main”,  run it directly

## Usage
Prepare a file with Hex values,  such as: 
```
#FFFFF0, #222220, #101010
#FFFFF1, #222221, #101011
```

Input the file path after the tool started, such as: 

`/Users/$(username)/Desktop/HexData`

The output file with suffix “RGBA”, whose content would be like: 
```
#FFFFF0 -> rgba: <255.0, 255.0, 240.0, 1.0>
#222220 -> rgba: <34.0, 34.0, 32.0, 1.0>
#101010 -> rgba: <16.0, 16.0, 16.0, 1.0>
#FFFFF1 -> rgba: <255.0, 255.0, 241.0, 1.0>
#222221 -> rgba: <34.0, 34.0, 33.0, 1.0>
#101011 -> rgba: <16.0, 16.0, 17.0, 1.0>
```
