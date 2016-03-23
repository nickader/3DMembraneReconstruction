% script for mamalian cell testing
% this is a script example to show how to analyze mamlian nucleus only
% using script


%% setting up and load movie
% select movie file
movie=CellVision3D.Movie('030416_NEFluc_3T3GFPmN2G_Stack_01_R3D.dv');
% movie=CellVision3D.Movie('wild_type_04.dv');
% set channels
label='mamalian membrane';
movie.setChannels('FluorescentMembrane3D',label);
% load movie to RAM
movie.load();
%% initialize channel
% get channel
channel = movie.getChannel(label);
% set the size of object to 100
channel.lobject=100;
% initialize the movie 
contours = channel.init(1);
%% construct cell 
% construct the cell only by membrane
cells = CellVision3D.Cell.constructCellsByMembrane(contours);
%% analyze cell
channel.run(cells,@(x)1,[]);
% run the analysis based on constructed cells
% channel.run(cells)