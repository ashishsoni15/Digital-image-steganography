function DecoderImplementer()
%Decoder- entry point

clear all;
Share1=imread('./trans/Share1.png');
Share2=imread('./trans/Share2.png');
SecretCode=input('Decoding Phase::Enter the secret code : ','s');
Key=createKey(keyimpl(strcat(SecretCode,fliplr(SecretCode))));
Decoded(:,:,1)=decodeChannel(Share1(:,:,1),Share2(:,:,1));
Decoded(:,:,2)=decodeChannel(Share1(:,:,2),Share2(:,:,2));
Decoded(:,:,3)=decodeChannel(Share1(:,:,3),Share2(:,:,3));

Output(:,:,1)=decryptImage(Decoded(:,:,1),Key);
Output(:,:,2)=decryptImage(Decoded(:,:,2),Key);
Output(:,:,3)=decryptImage(Decoded(:,:,3),Key);
imshow(Output),figure;
imwrite(Output,'./restore/Dithered.jpg');
Final(:,:,1)=restore(Output(:,:,1));
Final(:,:,2)=restore(Output(:,:,2));
Final(:,:,3)=restore(Output(:,:,3));
imshow(Final);
imwrite(Final,'./restore/Restored.jpg');
