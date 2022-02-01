function varargout = datc2figc(varargin)
% FIGCOORDINATES = DATC2FIGC({HAX},DATACOORDINATES)
% try to convert dataspace coordinates to figure coordinates
%
% HAX is an axes handle (optional; default is gca)
% DATACOORDINATES may be presented one of two ways:
%   DATC2FIGC({HAX},POSITION) -- as a 4-element vector [x0 y0 width height]
%   DATC2FIGC({HAX},X,Y) -- as simple X, Y vectors
% 
% FIGCOORDINATES has the same form as DATACOORDINATES
% 
% to my knowledge, this used to be an example
% accordingly, there is no documentation

if length(varargin{1}) == 1 && ishandle(varargin{1}) ...
                            && strcmp(get(varargin{1},'type'),'axes')   
    hAx = varargin{1};
    varargin = varargin(2:end);
else
    hAx = gca;
end
if length(varargin) == 1
    pos = varargin{1};
else
    [x,y] = deal(varargin{:});
end
axun = get(hAx,'Units');
set(hAx,'Units','normalized'); 
axpos = get(hAx,'Position');
axlim = axis(hAx);
axwidth = diff(axlim(1:2));
axheight = diff(axlim(3:4));
if exist('x','var')
    varargout{1} = (x - axlim(1)) * axpos(3) / axwidth + axpos(1);
    varargout{2} = (y - axlim(3)) * axpos(4) / axheight + axpos(2);
else
    pos(1) = (pos(1) - axlim(1)) / axwidth * axpos(3) + axpos(1);
    pos(2) = (pos(2) - axlim(3)) / axheight * axpos(4) + axpos(2);
    pos(3) = pos(3) * axpos(3) / axwidth;
    pos(4) = pos(4) * axpos(4 )/ axheight;
    varargout{1} = pos;
end
set(hAx,'Units',axun)
