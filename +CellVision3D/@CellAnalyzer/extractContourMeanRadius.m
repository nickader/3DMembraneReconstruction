function extractContourMeanRadius(cells,contourchannellabel)
% extract the mean radius in contours in 'contourchannellabel'
% the results are saved in the cells.contours.userdata.mean_radius
% 3/26/2016 Yao Zhao

for icell=1:length(cells)
    % get contours
    contours =cells(icell).contours;
    contours=contours(strcmp({contours.label},contourchannellabel));
    numcontours = length(contours);
    % number contours
    for icontour=1:numcontours
        radii = zeros(contours(icontour).numframes,1);
        for iframe =1:numframes
            radii(iframe)=CellVision3D.Math.Geometry.getPointSurfaceDistance(...
                particles(iparticle).positions(iframe,:),...
                contours(1).vertices{iframe},...
                contours(1).faces{iframe},contours(1).zxr);
        end
        contours(icontour).setUserData('mean_radius',dist);
    end
    
end




end

