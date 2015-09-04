% saveSingleImg( 'D:\ThetaPic\2015_01_13\LL\R0010210.JPG', 'D:\ThetaPic\2015_01_13\RR\R0010230.JPG',...
%     theta, 0, 1, 1, 15 );
% saveSingleImg( 'D:\ThetaPic\2015_01_13\LL\R0010211.JPG', 'D:\ThetaPic\2015_01_13\RR\R0010231.JPG',...
%     theta, 0, 1, 1, 15 );
% saveSingleImg( 'D:\ThetaPic\2015_01_13\LL\R0010212.JPG', 'D:\ThetaPic\2015_01_13\RR\R0010232.JPG',...
%     theta, 0, 1, 1, 15 );
% saveSingleImg( 'D:\ThetaPic\2015_01_13\LL\R0010213.JPG', 'D:\ThetaPic\2015_01_13\RR\R0010233.JPG',...
%     theta, 0, 1, 1, 15 );
% saveSingleImg( 'D:\ThetaPic\2015_01_13\LL\R0010214.JPG', 'D:\ThetaPic\2015_01_13\RR\R0010234.JPG',...
%     theta, 0, 1, 1, 15 );
function figure_keypress
    figure('KeyPressFcn',@printfig);
    surf(peaks)
    
    function printfig(~,event)
    % Callback to parse keypress event data to print a figure
        if event.Character == 'p'
            % On some systems you must send the file to a printer manually
            close;
            return;
        end
    end
end
