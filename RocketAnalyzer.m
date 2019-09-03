% Name: Nathan Chen and Bryce Sit
% Emails: nzchen@ncsu.edu and bcsit@ncsu.edu
% Date: 30 January 2018
% Lab Section: 205 for both
% Project 1: Rocket Simulation Analysis , Spring 2018
% Description: Taking in user data of a rocket and extracting data and
% making plots of the given data
clc; clear; close('all');

%% Part 2
%% Part 2.2: Reads in user inputed data for any .csv data set

data = input('Input Data Set file name with .csv attached: ' , 's');
info1 = csvread(data,2,0);

%% Part 2.3

% Part 2.3A: Finding the maximum altitude and the time it occurs by using
% the max command for all of column 2 and finding the index at which the
% time it occurs

[max_alt , index_time] = max(info1(:,2));
time = info1(index_time,1);
fprintf('Maxmimum altitude is %.2f at time %.2f\n', max_alt, time);

%Finding the maximum vertical accerleration and the time it occurs by using
%the max command and indexing the specific time

[max_verta , index_time] = max(info1(:,4));
time1 = info1(index_time,1);
fprintf('Maxmimum vertical acceleration is %.4f at time %.2f\n', max_verta, time1);

%Finding the minimal vertical accerleration and the time it occurs by using
%the minimum command and indexing the specific time

[min_verta , index_time] = min(info1(:,4));
time2 = info1(index_time,1);
fprintf('Minimimum vertical acceleration is %.4f at time %.2f\n', min_verta, time2);

%Find the duration of the entire test in minutes by finding the max time in
%the time column and dividing it by 60

time_total = max(info1(:,1));
time_total = time_total/60;
fprintf('Total Time it took: %.2f minutes\n', time_total);

%Find the average lateral distance in feet by taking the mean of column 5

average_lat = mean(info1(:,5));
fprintf('Average lateral distance: %.4f\n', average_lat);

%Find the average thrust by finding the mean of the thrust section 

average_thrust = mean(info1(:,7));
fprintf('Average thrust: %.4f\n', average_thrust);

%% Part 2.4
%Calculate the mach number of the rocket throughout its flight by dividing
%the vertical velocity all listed in column 3 by a

a = 1114.4;
Mach_num = info1(:,3)./a;

%% Part 2.5
% Part A: Plotting
% Plots Thrust vs time in the right side of the graph and plots propelant
% mass vs time on the left side of the same graph
figure(1)
x = info1(:,1);
y = info1(:,7);
yyaxis right
plot(x,y, 'r')
ylabel('Thrust (N)')
ylim([min(info1(:,7)), max(info1(:,7))]);

y = info1(:,6);
yyaxis left
plot(x,y ,'b')
ylabel('Propelant Mass (lbs)')
ylim([min(info1(:,6)), max(info1(:,6))]);

xlim([0,2.5]);

xlabel('Time (s)')
title('Propelant Mass and Thrust vs Time')
grid on

% Part B:

%Plotting altitude vs time on a black graph with the red line indicating
%the maximum altitude
figure(2)
subplot(2,2,1)
x = info1(:,1);
y = info1(:,2);
hold on
plot(x,y,'k')
plot([time,time],[min(info1(:,2)),max(info1(:,2))], 'r')
hold off
xlabel('Time (s)')
ylabel('Altitude (ft)')
title('Altitude vs Time')
grid on


xlim([min(info1(:,1)) , max(info1(:,1)) ])
ylim([min(info1(:,2)) , max(info1(:,2)) ])

%plotting vertical velocity vs time on a green graph with the red line indicating
%the maximum altitude
subplot(2,2,2)
x = info1(:,1);
y = info1(:,3);
hold on
plot(x,y,'g')
plot([time,time],[min(info1(:,3)),max(info1(:,3))],'r')
hold off

xlabel('Time (s)')
ylabel('Vertical Velocity (ft/s)')
title('Vertical Velocity vs Time')
grid on

xlim([min(info1(:,1)) , max(info1(:,1)) ])
ylim([min(info1(:,3)) , max(info1(:,3)) ])

%plotting vertical acceleration vs time on a magenta graph with the red line indicating
%the maximum altitude
subplot(2,2,3)
x = info1(:,1);
y = info1(:,4);
hold on
plot(x,y,'m')
plot([time,time],[min(info1(:,4)),max(info1(:,4))],'r')
hold off

xlabel('Time (s)')
ylabel('Vertical Acceleration (ft/s^s)')
title('Vertical Acceleration vs Time')
grid on

xlim([min(info1(:,1)) , max(info1(:,1)) ])
ylim([min(info1(:,4)) , max(info1(:,4)) ])

%plotting mach number vs time on a blue graph with the red line indicating
%the maximum altitude
subplot(2,2,4)
x = info1(:,1);
y = Mach_num;
hold on
plot(x,y,'b')
plot([time,time],[min(info1(:,4)),max(info1(:,4))],'r')
hold off

xlabel('Time (s)')
ylabel('Mach Number')
title('Mach Number vs Time')
grid on

xlim([min(info1(:,1)) , max(info1(:,1)) ])
ylim([min(Mach_num) , max(Mach_num) ])

%Part C
%Counts number of times descending and ascending in the rocket and plots
%them in a bar graph
figure(3)
ascending = sum(info1(:,3) > 0);
descending = sum(info1(:,3) < 0);
numbers = [ascending,descending];
bar(numbers,0.7)
set(gca, 'XTickLabel', {'Ascending', 'Descending'});
title('Number of data points ascending or descending')
ylabel('Number of data points')

if(ascending > descending)
    ylim([0,ascending])
else
    ylim([0,descending])
end
grid on




