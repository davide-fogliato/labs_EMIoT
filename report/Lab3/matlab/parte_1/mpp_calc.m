%calculate power
pow250 = [x250(:,1), x250(:,1).*x250(:,2)];
pow500 = [x500(:,1), x500(:,1).*x500(:,2)];
pow750 = [x750(:,1), x750(:,1).*x750(:,2)];
pow1000 = [x1000(:,1), x1000(:,1).*x1000(:,2)];

%find index of maximum power
[t, i250] = max(pow250(:,2));
[t, i500] = max(pow500(:,2));
[t, i750] = max(pow750(:,2));
[t, i1000] = max(pow1000(:,2));

%find V and I at mpp
mpp250 = x250(i250,:);
mpp500 = x500(i500,:);
mpp750 = x750(i750,:);
mpp1000 = x1000(i1000,:);