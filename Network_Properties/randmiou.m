function R = randmiou(R, ITER)

%Undirected strongly-connected graph --> randomised undirected graph
%Each edge rewired ~ITER times; in/out degree and connectedness preserved
%Rewiring algorithm from Maslov and Sneppen (2002) Science 296:910
%
% Mika Rubinov, 2007
% =========================================================================


[i j]=find(tril(R));
K=length(i);
ITER=K*ITER;

for iter=1:ITER
    les = 0;
    while 1                                     %while not rewired
        rewire=1;
        les = les + 1;
        %disp(les);
        if les==3000
            %disp('Number of iter achieved ...');
            break
        end;
        les1 = 0;
        while 1
            les1 = les1 + 1;
            if les1==3000
                break
            end;
            e1=ceil(K*rand);
            e2=ceil(K*rand);
            while (e2==e1),
                e2=ceil(K*rand);
            end
            a=i(e1); b=j(e1);
            c=i(e2); d=j(e2);

            if all(a~=[c d]) && all(b~=[c d]);
                break           %all four vertices must be different
            end
        end

        %rewiring condition
        if ~(R(a,d) || R(c,b))
            %connectedness condition
            les2 = 0;
            if ~(R(a,c) || R(b,d))
                P=R([a d],:);
                P(1,b)=0; P(2,c)=0;
                PN=P;
                PN(:,d)=1; PN(:,a)=1; 
                
                les2 = les2 + 1;
                if les2==3000
                    break
                end;
                
                while 1                   
                    P(1,:)=any(R(P(1,:)~=0,:),1);
                    P(2,:)=any(R(P(2,:)~=0,:),1);
                    P=P.*(~PN);

                    if ~all(any(P,2))
                        rewire=0;
                        break
                    elseif any(any(P(:,[b c])))
                        break
                    end
                    PN=PN+P;
                    %les = les + 1;
                    %disp(les);
               end
            end %connectedness testing
            %disp(['Este es = ' num2str(les)]);

            if rewire               %reassign edges
                R(a,d)=R(a,b); R(a,b)=0;
                R(d,a)=R(b,a); R(b,a)=0;
                R(c,b)=R(c,d); R(c,d)=0;
                R(b,c)=R(d,c); R(d,c)=0;

                j(e1) = d;          %reassign edge indices
                j(e2) = b;
                break;
            end %edge reassignment
        end %rewiring condition

    end %while not rewired
end %iterations