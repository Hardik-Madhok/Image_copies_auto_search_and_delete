 function gui_1()
close all
clear all
clc

curr_str_0 = [];
curr_str_1 = [];
curr_str_2 = [];
a_file = [];

figure_1 = figure('MenuBar','none','Toolbar','none','Units','centimeters','Name','Find a copy image','NumberTitle','off','Position',[1,2,15,4]);

sel_img = uicontrol('parent',figure_1,'Style','Text','String','Select Image :','Units','centimeters','Position',[0.5 3 5 0.5],'HorizontalAlignment','Left','FontSize',8);
view_str_0 = uicontrol('parent',figure_1,'Style','Text','String','','Units','centimeters','Position',[5 3 9.5 0.5],'BackgroundColor',[1 1 1],'HorizontalAlignment','Left','FontSize',8);
open_file =uicontrol('parent',figure_1,'Style','Pushbutton','Units','centimeters','String','Open','Position',[12.5,2.5,2,0.5],...
    'FontSize',8,'HorizontalAlignment','Center','CallBack',@rot_open);

search_path = uicontrol('parent',figure_1,'Style','Text','String','Select Path :','Units','centimeters','Position',[0.5 1.9 5 0.5],'HorizontalAlignment','Left','FontSize',8);
view_str_1 = uicontrol('parent',figure_1,'Style','Text','String','','Units','centimeters','Position',[5 1.9 9.5 0.5],'BackgroundColor',[1 1 1],'HorizontalAlignment','Left','FontSize',8);
search_file =uicontrol('parent',figure_1,'Style','Pushbutton','Units','centimeters','String','Search','Position',[12.5,1.4,2,0.5],...
    'FontSize',8,'HorizontalAlignment','Center','CallBack',@rot_search);

no_copy = uicontrol('parent',figure_1,'Style','Text','String','Number of Copies :','Units','centimeters','Position',[0.5 0.8 5 0.5],'HorizontalAlignment','Left','FontSize',8);
view_str_2 = uicontrol('parent',figure_1,'Style','Text','String','','Units','centimeters','Position',[5 0.8 9.5 0.5],'BackgroundColor',[1 1 1],'HorizontalAlignment','Left','FontSize',8);
del_file =uicontrol('parent',figure_1,'Style','Pushbutton','Units','centimeters','String','Delete','Position',[12.5,0.3,2,0.5],...
    'FontSize',8,'HorizontalAlignment','Center','CallBack',@rot_del);
view_file =uicontrol('parent',figure_1,'Style','Pushbutton','Units','centimeters','String','View','Position',[10,0.3,2,0.5],...
    'FontSize',8,'HorizontalAlignment','Center','CallBack',@rot_view);




view_text = uicontrol('parent',figure_1,'Style','Text','String','© Sampler by Mr. Madhok copyrights reserve','Units','centimeters','Position',[0.25,0.01,8,0.5],'HorizontalAlignment','Left','FontSize',7);


%////////////////////////callback functions////////////////
function rot_open(varargin)
    curr_str_0 = [];
    curr_str_0 = uigetfile({'*.jpg';'*.png';'*.bmp';'*.gif';'*.tif'},'Select the file');
    set(view_str_0,'String',curr_str_0);
    drawnow
end

function rot_search(varargin)
    curr_str_1 = [];
    curr_str_1 = uigetdir('Select the path for search');
    set(view_str_1,'String',curr_str_1);
    drawnow
end


function rot_view(varargin)
    no_copy = 0;
    img = imread(curr_str_0);

    info_0 = imfinfo(curr_str_0);
    info_1 = struct2cell(info_0);

    listing_0 = dir(curr_str_1);
    listing_1 = struct2cell(listing_0);

    s1 = info_1(2);
    for i=1:length(listing_0)
        s2 = listing_1(3,i);
        t = strcmp(s1,s2);
        if t==1
            copy = listing_1(:,i);
            a_file = copy(1,1);
            no_copy = no_copy+1;
        end
    end
    curr_str_2 = no_copy;
    set(view_str_2,'String',curr_str_2);
end

function rot_del(varargin)
    if curr_str_2 >= 1
        b_file = cell2mat(a_file);
        c_file = mat2str(b_file);
        c_file = strrep(c_file,'''','');
        f = fullfile(curr_str_1,c_file);
        delete (f);
        d = msgbox('Deleted');
        d;
    else
        d = msgbox('No copies found!');
        d;
    end
    curr_str_0 = [];
    set(view_str_0,'String',curr_str_0);
    curr_str_1 = [];
    set(view_str_1,'String',curr_str_1);
    curr_str_2 = [];
    set(view_str_2,'String',curr_str_2);
    a_file = [];
    
end



end