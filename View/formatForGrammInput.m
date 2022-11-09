function forGramm = formatForGrammInput(IDX)
%% Format of forGramm output variable
% The desired output here is to make a (n x 4) cell array where n is the
% number of trials. In the example day, this is 205 trials with monoc or
% IOT presentations.
% We want 5 variables (or collumns) because we currently desire these:
%   1. Condition label: a string such as "monocular_PO_LE"
%   2. Continuous Data: (1 x sdftm) e.g. (1 x 951) with spking responses
%   3. response categorical label - transient vs sustained 
%   4. RESP bin value: RESP(1 || 2) %% 1 is transient 2 is sustained


win_ms = IDX.allV1(1).win_ms;

%% the table loop
count = 0;
for unitOfInterest = 1:length(IDX.allV1)
    for cond = 1:4 %We have 4 conditions of interest: A, B, C, D.
        for singleTrial = 1:IDX.allV1(unitOfInterest).CondTrialNum(cond)
            count = count+1;
            trlLabel_1{count,:}       = IDX.allV1(unitOfInterest).CondLabel{cond};
            depthLabel_1{count,:}     = IDX.allV1(unitOfInterest).depthLabel;
            SDF_singleTrials{count,:}     = IDX.allV1(unitOfInterest).condSelect_zsSDF{cond}(:,singleTrial);
            monkeyLabel{count,:}     = IDX.allV1(unitOfInterest).monkey;
        end
    end
end

count = 0;
for unitOfInterest = 1:length(IDX.allV1)
    for cond = 1:4 %We have 4 conditions of interest: A, B, C, D.
        for singleTrial = 1:IDX.allV1(unitOfInterest).CondTrialNum(cond)
            for respBinLoop = 1:3
                count = count + 1;
                if respBinLoop == 1
                    RESPbinLabel{count,:}   = 'Transient';
                elseif respBinLoop == 2
                    RESPbinLabel{count,:}   = 'Sustained';
                elseif respBinLoop == 3
                    RESPbinLabel{count,:}   = 'Long Sustained';
                end
                trlLabel_2{count,:}       = IDX.allV1(unitOfInterest).CondLabel{cond};
                depthLabel_2{count,:}     = IDX.allV1(unitOfInterest).depthLabel;
                RESPbinVal(count,:) = IDX.allV1(unitOfInterest).condSelect_pcRESP{cond}(respBinLoop,singleTrial);  
            end
        end
    end
end




forGramm.SDF = table(trlLabel_1,depthLabel_1,monkeyLabel, SDF_singleTrials);
forGramm.RESP = table(trlLabel_2,depthLabel_2, RESPbinLabel, RESPbinVal);


end