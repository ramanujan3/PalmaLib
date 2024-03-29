function SScatter2(block)
% Level-2 M file S-Function for times two demo.
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $ 

  setup(block);
  
%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 5;
  block.NumOutputPorts = 1;

  %% Setup functional port properties to dynamically
  %% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 

  block.InputPort(1).Complexity   = 'Real'; 
  block.InputPort(1).DataTypeId   = 0;
  block.InputPort(1).SamplingMode = 'Sample';
  block.InputPort(1).Dimensions   = 1;
  
  block.InputPort(2).Complexity   = 'Real';
  block.InputPort(2).DataTypeId   = 0;
  block.InputPort(2).SamplingMode = 'Sample';
  %block.InputPort(2).Dimensions   = 1;
  
  block.InputPort(3).Complexity   = 'Real';
  block.InputPort(3).DataTypeId   = 0;
  block.InputPort(3).SamplingMode = 'Sample';
  %block.InputPort(3).Dimensions   = 1;
  
  block.InputPort(4).Complexity   = 'Real';
  block.InputPort(4).DataTypeId   = 0;
  block.InputPort(4).SamplingMode = 'Sample';
  %block.InputPort(4).Dimensions   = 1;
  
  block.InputPort(5).Complexity   = 'Real';
  block.InputPort(5).DataTypeId   = 0;
  block.InputPort(5).SamplingMode = 'Sample';
  %block.InputPort(5).Dimensions   = 1;
  
  block.OutputPort(1).Complexity   = 'Real';
  block.OutputPort(1).DataTypeId   = 0;
  block.OutputPort(1).SamplingMode = 'Sample';
  block.OutputPort(1).Dimensions   = 1;
  
  %block.InputPort(1).DirectFeedthrough = true;
  %block.InputPort(2).DirectFeedthrough = true;
  %block.InputPort(3).DirectFeedthrough = true;
  
  %% Set block sample time to inherited
  block.SampleTimes = [-1 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

  %% Run accelerator on TLC
  block.SetAccelRunOnTLC(true);
  
  %% Register methods
  block.RegBlockMethod('Outputs', @Output);

  % Inherit datatype id for non-built-in datatypes
  block.RegBlockMethod('SetInputPortDataType', @SetInpPortDataType);
  block.RegBlockMethod('SetOutputPortDataType', @SetOutputPortDataType);

%endfunction

function Output(block)

  %scatter(block.InputPort(1).Data, block.InputPort(2).Data, block.InputPort(3).Data, block.InputPort(4).Data, block.InputPort(5).Data);
  hold(block.InputPort(1).Data, 'off');
  scatter(block.InputPort(1).Data, block.InputPort(2).Data, block.InputPort(3).Data, 'bs');
  hold(block.InputPort(1).Data, 'on');
  scatter(block.InputPort(1).Data,  block.InputPort(4).Data, block.InputPort(5).Data, 'ro');
  %hold off;
  block.OutputPort(1).Data = 0;
  
%endfunction

