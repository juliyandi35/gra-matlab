function [ Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref)
SbestRPM=(RPM-RPM_target).^2;%,RGrade,Rank
SbestTe=(Te-Te_target).^2;
SbestIs=(Is-Is_target).^2;
Sbest=[SbestRPM SbestTe SbestIs];
Sbest_max=max([SbestRPM SbestTe SbestIs]);
Sbest_min=min([SbestRPM SbestTe SbestIs]);
NomSbestRPM=(Sbest_max(1)-SbestRPM)./(Sbest_max(1)-Sbest_min(1));
NomSbestTe=(Sbest_max(2)-SbestTe)./(Sbest_max(2)-Sbest_min(2));
NomSbestIs=(Sbest_max(3)-SbestIs)./(Sbest_max(3)-Sbest_min(3));
NomSbest=[NomSbestRPM NomSbestTe NomSbestIs];
Weighted=NomSbest./3;
AbsDiff=abs(ref-Weighted); 
end

