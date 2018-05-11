function outMFs = getTriPartitions(MFsNumber, a, b )
%partition to some traingular membership functions
outMFs= zeros(MFsNumber,3);
c = (b-a)/(MFsNumber-1);
outMFs(1,1) = a; outMFs(1,2) = a; outMFs(1,3) = a+c;
outMFs(MFsNumber,1) = b-c; outMFs(MFsNumber,2) = b; outMFs(MFsNumber,3) = b;
for i=2:MFsNumber-1
    s = a+((i-1)*c);
   outMFs(i,1) = s-c; outMFs(i,2) = s; outMFs(i,3) = s+c;
end

end

