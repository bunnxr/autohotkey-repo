echo off
FOR %%d IN (a: b: c: d: e: f: g: h: i: j: k: l: m: n: o: p: q: r: s: t: u: v: w: x: y: z:) DO IF EXIST %%d\sync.ini SET var1=%%d
xcopy "D:\@charlie" "%var1%\@charlie\" /c /i /e /h /y
attrib +s -h "%var1%\@charlie"
pause