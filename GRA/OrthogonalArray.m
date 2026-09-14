function orthArray = OrthogonalArray(oA)
Rs1=oA(:,1)==1;
Rs2=oA (:,1); Rs2(( Rs2== 2))=2;  Rs2(( Rs2~=2))=0;
Rs3=oA (:,1); Rs3(( Rs2== 3))=3;  Rs3(( Rs3~=3))=0;
Rs=[ Rs1 Rs2 Rs3];
Rb1=oA(:,2)==1;
Rb2=oA (:,2); Rb2(( Rb2== 2))=2;  Rb2(( Rb2~=2))=0;
Rb3=oA (:,2); Rb3(( Rb2== 3))=3;  Rb3(( Rb3~=3))=0;
Rb=[ Rb1 Rb2 Rb3];
Re1=oA(:,3)==1;
Re2=oA (:,3); Re2(( Re2== 2))=2;  Re2(( Re2~=2))=0;
Re3=oA (:,3); Re2(( Re2== 3))=3;  Re3(( Re3~=3))=0;
Re=[ Re1 Re2 Re3];
Ls1=oA(:,4)==1;
Ls2=oA (:,4); Ls2(( Ls2== 2))=2;  Ls2(( Ls2~=2))=0;
Ls3=oA (:,4); Ls3(( Ls2== 3))=3;  Ls3(( Ls3~=3))=0;
Ls=[ Ls1 Ls2 Ls3];
Lb1=oA(:,5)==1;
Lb2=oA (:,5); Lb2(( Lb2== 2))=2;  Lb2(( Lb2~=2))=0;
Lb3=oA (:,5); Lb3(( Lb2== 3))=3;  Lb3(( Lb3~=3))=0;
Lb=[ Lb1 Lb2 Lb3];
Le1=oA(:,6)==1;
Le2=oA (:,6); Le2(( Le2== 2))=2;  Le2(( Le2~=2))=0;
Le3=oA (:,6); Le3(( Le2== 3))=3;  Le3(( Le3~=3))=0;
Le=[ Le1 Le2 Le3];
orthArray = [Rs Rb Re Ls Lb Le];
end