function plotStdIOTwithGramm(forGramm,IDX)



close all
sdftm = IDX.allV1(1).TM;
% Gramm plots for vis repeated trajectories
clear g
g=gramm('x',sdftm,'y',forGramm.SDF.SDF_singleTrials,...
    'color',forGramm.SDF.trlLabel_1, 'subset',...
   ~strcmp(forGramm.SDF.depthLabel_1, 'O'));
g.facet_grid([],forGramm.SDF.trlLabel_1)

g.stat_summary('bin_in',500);
g.axe_property('YLim',[-.05 2]);
g.axe_property('XLim',[-.05 .79]);
g.set_title('Interocular Transfer of Adaptation: Full stimulus timecourse')
g.set_names('column','Stimulus','x','Time (s) from onset',...
    'y','MUA response, in z-scored change from baseline',...
    'color','Stimulus')
figure('Position',[80 58 1757 878]);
g.draw();

%h plotting
sdftm = IDX.allV1(1).TM;
clear h
h(1,1)=gramm('x',sdftm,'y',forGramm.SDF.SDF_singleTrials,...
    'color',forGramm.SDF.trlLabel_1, 'subset',...
   (strcmp(forGramm.SDF.trlLabel_1, 'A. Prefered eye monocular') |...
   strcmp(forGramm.SDF.trlLabel_1, 'D. Prefered eye adapted'))  &...
   ~strcmp(forGramm.SDF.depthLabel_1, 'O') ...
   );

h.stat_summary('bin_in',500);
h.axe_property('YLim',[-.05 2]);
h.axe_property('XLim',[-.05 .79]);
h.set_title('Monocular vs Adapted')
h.set_names('x','Time (s) from onset',...
    'y','MUA response, in z-scored change from baseline',...
    'color','Stimulus')
figure('Position',[80 58 1757 878]);
h.draw();


%i plotting
sdftm = IDX.allV1(1).TM;
clear i
i(1,1)=gramm('x',sdftm,'y',forGramm.SDF.SDF_singleTrials,...
    'color',forGramm.SDF.trlLabel_1, 'subset',...
   (strcmp(forGramm.SDF.trlLabel_1, 'C. Null eye monocular') |...
   strcmp(forGramm.SDF.trlLabel_1, 'B. Null eye adapted'))  &...
   ~strcmp(forGramm.SDF.depthLabel_1, 'O')...
   );

i.stat_summary('bin_in',500);
i.axe_property('YLim',[-.05 2]);
i.axe_property('XLim',[-.05 .79]);
i.set_title('Monocular vs Adapted')
i.set_names('x','Time (s) from onset',...
    'y','MUA response, in z-scored change from baseline',...
    'color','Stimulus')
figure('Position',[80 58 1757 878]);
i.draw();

%% Laminar breakdown
clear j
j=gramm('x',sdftm,'y',forGramm.SDF.SDF_singleTrials,...
    'color',forGramm.SDF.trlLabel_1, 'subset',...
   (strcmp(forGramm.SDF.trlLabel_1, 'A. Prefered eye monocular') |...
   strcmp(forGramm.SDF.trlLabel_1, 'D. Prefered eye adapted'))  &...
   ~strcmp(forGramm.SDF.depthLabel_1, 'O') & ...
   ~strcmp(forGramm.SDF.monkeyLabel, 'B'));
j.facet_grid(forGramm.SDF.depthLabel_1,[])

j.stat_summary('bin_in',500);
j.axe_property('YLim',[-.05 2]);
j.axe_property('XLim',[-.05 .79]);
j.set_title('Onset vs adapted: Monocular preferred eye')
j.set_names('row','Laminar Compartment','x','Time (s) from onset',...
    'y','MUA response, in z-scored change from baseline',...
    'color','Stimulus')
j.set_order_options("row",0)
figure('Position',[80 58 1757 878]);
j.draw();


clear k
k=gramm('x',sdftm,'y',forGramm.SDF.SDF_singleTrials,...
    'color',forGramm.SDF.trlLabel_1, 'subset',...
   (strcmp(forGramm.SDF.trlLabel_1, 'C. Null eye monocular') |...
   strcmp(forGramm.SDF.trlLabel_1, 'B. Null eye adapted'))  &...
   ~strcmp(forGramm.SDF.depthLabel_1, 'O') & ...
   ~strcmp(forGramm.SDF.monkeyLabel, 'B'));
k.facet_grid(forGramm.SDF.depthLabel_1,[])

k.stat_summary('bin_in',500);
k.axe_property('YLim',[-.05 2]);
k.axe_property('XLim',[-.05 .79]);
k.set_title('Null eye - floor effect observed')
k.set_names('row','Laminar Compartment','x','Time (s) from onset',...
    'y','MUA response, in z-scored change from baseline',...
    'color','Stimulus')
k.set_order_options("row",0)
figure('Position',[80 58 1757 878]);
k.draw();

%% Plot Response values (so I don't have to in JASP tonight)


% % % %% Save all the figs
% % % global OUTDIR_PLOT  
% % % cd(OUTDIR_PLOT)
% % % figNameList = {'IOT_fullTM','PrefEye_Avg','NullEye_Avg','PrefEye_Laminar','PrefEye_Laminar'};
% % % 
% % % FolderName = OUTDIR_PLOT;   % Your destination folder
% % % cd(FolderName)
% % % FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
% % % for iFig = 1:length(FigList)
% % %   FigHandle = FigList(iFig);
% % %   FigName   = figNameList{iFig};
% % %   savefig(FigHandle, strcat(FolderName, FigName, '.fig'));
% % %   saveas(FigHandle, strcat(FolderName, FigName, '.svg'));
% % % 
% % % end

end

