# rnoc
Verilog Code for NoC

## Fabric
```
12 13 14 15
8  9  10 11
4  5  6  7
0  1  2  3
```

## noc1(src1) Configuration -----Under Revisions
### Flit Format
|0-1   |    2-6    |   7-8  | 9-10  |11-74|
| :-: | :-: | :-: | :-: | :-: |
|FlitType| Next_Port| X_Des| Y_Des |DATA

## noc2(src2) Configuration ------Down
FIFO_Depth 5
VC_NUM   2

### Flit Format
|35-33 | 7-4 | 3-0 |
| :-: | :-: | :-: |
|FlitType | SRC | DST |


### PPA
latency 4cycle/hop