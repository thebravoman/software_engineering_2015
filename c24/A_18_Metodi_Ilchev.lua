local prime1,prime2=11,23


function deliteli(num)
  local tb={}
  for i=2,num/2 do
    if num%i==0 then table.insert(tb,i) end
  end
  return tb
end


n=prime1*prime2
tont=(prime1-1)*(prime2-1)

local deli=deliteli(tont)
for k,v in pairs(deli) do
  print(v)
end
for i=2,tont-1 do
  for k,v in pairs(deli) do
    
  end
end
