function fire = getFireRule( MFs, MfNumber, data)
%get fire rule value
fire = 0;
if ( data < MFs(MfNumber,1) || data > MFs(MfNumber,3))
    return;
end
if(data <= MFs(MfNumber,2))
    fire = getY([MFs(MfNumber,1) 0],[MFs(MfNumber,2) 1],data);
else
    fire = getY([MFs(MfNumber,2) 1],[MFs(MfNumber,3) 0],data);
end

end

