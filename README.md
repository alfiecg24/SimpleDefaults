# SimpleDefaults

A simple way to save your classes and structs to UserDefaults

SimpleDefaults enables a much easier method of saving custom objects into UserDefaults. By doing all the JSON decoding behind the scenes, all you have to do is this:

```
import SimpleDefaults

do {
  try UserDefaults.standard.setCustomObject(MyObject, forKey: "MyObject")
  try UserDefaults.standard.getCustomObject(forKey: "MyObject", castTo: MyObject.self)
} 
catch { ... }
```
