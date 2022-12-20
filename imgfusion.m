% Function to create fused image
function outimage=imgfusion(Im1, Im2,ftype,wtype)
[cA1, cH1, cV1, cD1]=dwt2(double(Im1),wtype,'per');
[cA2, cH2, cV2, cD2]=dwt2(double(Im2),wtype,'per');
[r, c]=size (cA1);
cA=zeros(r, c);
cH=zeros(r, c);
cV=zeros(r, c);
cD=zeros(r, c);
switch ftype
case'MeanMean'
for i=1:r
for k=1:c
cA (i, k) =mean ( [cA1(i, k), cA2(i, k)]);
cH (i, k) =mean ( [cH1(i, k), cH2(i, k)]);
cV (i, k) =mean ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =mean ( [cD1(i, k), cD2(i, k)]);
end
end
case 'MeanMax'
for i=1:r
for k=1:c
cA (i, k) =mean ( [cA1(i, k), cA2(i, k)]);
cH (i, k) =max ([cH1(i, k), cH2(i, k)]);
cV (i, k) =max ([cV1(i, k), cV2(i, k)]);
cD (i, k) =max ([cD1(i, k), cD2(i, k)]);
end
end
case 'MeanMin'
for i=1:r
for k=1:c
cA (i, k) =mean ( [cA1(i, k), cA2(i, k)]);
cH (i, k) =min ([cH1(i, k), cH2(i, k)]);
cV (i, k) =min ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =min ( [cD1(i, k), cD2(i, k)]);
end
end
case 'MaxMean'
for i=1:r
for k=1:c
cA (i, k) =max ([cA1(i, k), cA2(i, k)]);
cH (i, k) =mean ([cH1(i, k), cH2(i, k)]);
cV (i, k) =mean ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =mean ( [cD1(i, k), cD2(i, k)]);
end
end
case 'MaxMax'
for i=1:r
for k=1:c
cA (i, k) =max ([cA1(i, k), cA2(i, k)]);
cH (i, k) =max ([cH1(i, k), cH2(i, k)]);
cV (i, k) =max ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =max( [cD1(i, k), cD2(i, k)]);
end
end
case 'MaxMin'
for i=1:r
for k=1:c
cA (i, k) =max ([cA1(i, k), cA2(i, k)]);
cH (i, k) =min ([cH1(i, k), cH2(i, k)]);
cV (i, k) =min ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =min ([cD1(i, k), cD2(i, k)]);
end
end
case 'MinMean'
for i=1:r
for k=1:c
cA (i, k) =min ([A1(i, k), cA2(i, k)]);
cH (i, k) =mean ([cH1(i, k), cH2(i, k)]);
cV (i, k) =mean ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =mean ([cD1(i, k), cD2(i, k)]);
end
end
case 'MinMax'
for i=1:r
for k=1:c
cA (i, k) =min ([cA1(i, k), cA2(i, k)]);
cH (i, k) =max ([cH1(i, k), cH2(i, k)]);
cV (i, k) =max ( [cV1(i, k), cV2(i, k)]);
cD (i, k) =max ([cD1(i, k), cD2(i, k)]);
end
end
case 'MinMin'
for i=1:r
for k=1:c
cA(i, k) =min ([cA1(i, k), cA2(i, k)]);
cH(i, k) =min ([cH1(i, k), cH2(i, k)]);
cV(i, k) =min ([cV1(i, k), cV2(i, k)]);
cD(i, k) =min ([cD1(i, k), cD2(i, k)]);
end
end
end
outimage=idwt2(cA, cH, cV, cD, wtype, 'per');