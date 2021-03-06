function eegObj = backProjectBrainComponents( icaObj )
indices = extractBrainComponents( icaObj );

%--
metadata  = load( icaObj.parent.header ,'-mat');
newHeader = createNewHeader(metadata);
eegObj    = icaObj.container.addItem( newHeader );
%--

W = icaObj.icawinv( :, indices)';
eegObj.data = icaObj.data(:, indices) * W;
if icaObj.isGuiActive, icaObj.refreshGui;end
end