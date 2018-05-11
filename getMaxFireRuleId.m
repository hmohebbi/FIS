function [id, maxFire] = getMaxFireRuleId( MFs, data)
%get maximum of fire rule value
maxFire = 0;
for numberOfMFs = 1:size(MFs,1)
    if ( data < MFs(numberOfMFs,1) || data > MFs(numberOfMFs,3))
        continue;
    end
    if(data <= MFs(numberOfMFs,2))
        fire = getY([MFs(numberOfMFs,1) 0],[MFs(numberOfMFs,2) 1],data);
    else
        fire = getY([MFs(numberOfMFs,2) 1],[MFs(numberOfMFs,3) 0],data);
    end
    if (fire > maxFire)
        maxFire = fire;
        id = numberOfMFs;
    end
    
end

end

