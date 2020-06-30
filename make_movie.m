close all
clc
clear all


%% set figure properties
set(0,'DefaultAxesFontSize',40);
set(0,'DefaultLegendFontSize',40);
set(0,'DefaultTextFontSize', 40)
set(0,'DefaultLineMarkerSize', 20)
set(0,'DefaultLineLineWidth', 5)
% set(0,'DefaultMarkerMarkerSize', 5)
set(0,'defaultUicontrolFontName', 'Arial')
set(0,'defaultUitableFontName', 'Arial')
set(0,'defaultAxesFontName', 'Arial')
set(0,'defaultTextFontName', 'Arial')
set(0,'defaultUipanelFontName', 'Arial')

video = VideoWriter('flow.avi');
video.FrameRate = 4;
open(video);

files= dir('*.tif');
fig = figure('name','movie','Position', get(0, 'Screensize'));
fig.Color = 'w';

for i=1:numel(files)
    disp(i)
    img = imread(files(i).name);
    img_source(:,:,i) = uint8(img(:,:,1));
    imshow(img_source(:,:,i),[])
    txt = num2str(i);
    title(txt)
    warning('off','Images:initSize:adjustingMag');
    F(i) = getframe(fig);
    writeVideo(video,F(i));
    
end

close(video)

