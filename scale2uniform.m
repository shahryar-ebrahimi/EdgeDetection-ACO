function [ output ] = scale2uniform( input )

output = (input - min(min(input)))/(max(max(input))-min(min(input)));

end

