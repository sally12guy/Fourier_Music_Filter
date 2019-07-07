% ??���x?win8+matlabR2012
% matlab���N?�G(�`�N�G�N?�bmatlab2012�W???��q?�A�p�G�Omatlab2007��????��???�ǫ�?���A�Q�Ψ�?rgb2gray)

% �q???��?�J��l?���B���L?��,?���榡?.bmp
   %[fname,pname] = uigetfile('*.bmp','????���G') 
   % ori_pic = imread('ori_pic.bmp','bmp');
   ori_pic = imread('08.jpg');
   subplot(2,2,1);
   imshow(ori_pic);
   title('��?��');


%[fname,pname] = uigetfile('*.bmp','???���L?���G')
watermark = imread('01.jpg');
subplot(2,2,2);
imshow(watermark); 
title('���L?��');


% ?��l?��?��?�z:double()?�z�A?��p�i���� haar�p�i��
   ori_pic_trans = double(ori_pic); 
   watermark_trans = double(watermark);
   [Cwr,Swr] = wavedec2(watermark_trans,1,'haar');
   [Cr,Sr] = wavedec2(ori_pic_trans,2,'haar');

   a = 0.06;


  for k = 0:1:size(Cr,2)/size(Cwr,2)-1
         Cr(1+size(Cr,2)/4+k*size(Cwr,2)/4 : size(Cr,2)/4+(k+1)*size(Cwr,2)/4) = Cr(1+size(Cr,2)/4+k*size(Cwr,2)/4 : size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+a*Cwr(1+size(Cwr,2)/4:size(Cwr,2)/2);
        Cr(1+size(Cr,2)/2+k*size(Cwr,2)/4 : size(Cr,2)/2+(k+1)*size(Cwr,2)/4) = Cr(1+size(Cr,2)/2+k*size(Cwr,2)/4 : size(Cr,2)/2+(k+1)*size(Cwr,2)/4)+a*Cwr(1+size(Cwr,2)/2:3*size(Cwr,2)/4);
        Cr(1+3*size(Cr,2)/4+k*size(Cwr,2)/4 : 3*size(Cr,2)/4+(k+1)*size(Cwr,2)/4) = Cr(1+3*size(Cr,2)/4+k*size(Cwr,2)/4 : 3*size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+a*Cwr(1+3*size(Cwr,2)/4:size(Cwr,2));
  end;


Cr(1:size(Cwr,2)/4) = Cr(1:size(Cwr,2)/4) + a*Cwr(1:size(Cwr,2)/4);


% �Q�Τp�i����?��
ori_pic_trans = waverec2(Cr,Sr,'haar');
output = uint8(round(ori_pic_trans));
subplot(2,2,3);
imshow(output,[]);
title('�O�J���L�Z��?��');

% ?�O�J���L�Z��?���K�[��?��?
embed_noise = imnoise(output,'salt & pepper',0.04);
subplot(2,2,4);
imshow(embed_noise);
title('�[��?��?�Z��?��');


[Ca,Sa] = wavedec2(ori_pic_trans,2,'haar');
% ori_pic0 = imread('ori_pic.bmp','bmp');
ori_pic01 = double(ori_pic(:,:,1));


[Ca1,Sa1] = wavedec2(ori_pic01,2,'haar');
Cwr(1:size(Cwr,2)/4) = (Ca(1:size(Cwr,2)/4) - Ca1(1:size(Cwr,2)/4))/a;
watermark_trans = waverec2(Cwr,Swr,'haar');
output = uint8(round(watermark_trans));
figure,
subplot(2,2,1);
imshow(output,[]);
title('���������L?��');

[Ca2,Sa2] = wavedec2(embed_noise,2,'haar');
Cwr(1:size(Cwr,2)/4) = (Ca(1:size(Cwr,2)/4) - Ca1(1:size(Cwr,2)/4))/a;
watermark_trans = waverec2(Cwr,Swr,'haar');
output2 = uint8(round(watermark_trans));
subplot(2,2,2);
imshow(output2,[]);
title('�����[��?�Z�����L?��');