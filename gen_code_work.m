%I = eye(211)
%I1 = circshift(I,[0,2])
%I2 = circshift(I,[0,3])
%I3 = circshift(I,[0,110])
%I4 = circshift(I,[0,142])
%I5 = circshift(I,[0,165])
%I6 = circshift(I,[0,5])
%I7 = circshift(I,[0,64])
%I8 = circshift(I,[0,96])
%I9 = circshift(I,[0,113])
%I10 = circshift(I,[0,144])
%I11 = circshift(I,[0,7])
%I12 = circshift(I,[0,50])
%I13 = circshift(I,[0,75])
%I14 = circshift(I,[0,116])
%I15 = circshift(I,[0,174])
%Ifinal = [I1 I2 I3 I4 I5;I6 I7 I8 I9 I10;I11 I12 I13 I14 I15]

I = eye(33)
I1 = circshift(I,[0,2])
I2 = circshift(I,[0,3])
I3 = circshift(I,[0,7])
I4 = circshift(I,[0,9])
I5 = circshift(I,[0,15])
I6 = circshift(I,[0,20])
I7 = circshift(I,[0,4])
I8 = circshift(I,[0,5])
I9 = circshift(I,[0,11])
I10 = circshift(I,[0,12])
I11 = circshift(I,[0,23])
I12 = circshift(I,[0,25])
I13 = circshift(I,[0,6])
I14 = circshift(I,[0,8])
I15 = circshift(I,[0,14])
I16 = circshift(I,[0,19])
I17 = circshift(I,[0,27])
I18 = circshift(I,[0,30])
Ifinal = [I1 I2 I3 I4 I5 I6; I7 I8 I9 I10 I11 I12; I13 I14 I15 I16 I17 I18]
Itran = transpose(Ifinal);

Iin = round(0.75*rand(1,99))
fid1 = fopen('data_to_encode.txt', 'w+');
for i=1:size(Iin, 1)
    fprintf(fid1, '%f ', Iin(i,:));
    fprintf(fid1, '\n');
end
fclose(fid1);

Iout = Iin * Ifinal

Ioutfinal = awgn(Iout,0.6)

fid2 = fopen('data_to_decoder.txt', 'w+');
for i=1:size(Ioutfinal, 1)
    fprintf(fid2, '%f ', Ioutfinal(i,:));
    fprintf(fid2, '\n');
end
fclose(fid2);