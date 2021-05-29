program Implementing_Queue;

Type
	Queue = record
		arr : array[1..100] of  Integer;
		front:Integer;
		max_size:integer;
		rear : integer;
end;

function is_empty(qu:Queue): integer;
begin
	if (qu.rear < 1) then
		is_empty:=1
	else
		is_empty:=0;
end;

function is_full(qu:Queue): Boolean;
begin
	if(qu.rear = qu.max_size) then
		is_full:=True
	else
		is_full:=False;
end;

function Enqueue(qu:Queue;x:Integer): Queue;
begin
		if(is_full(qu) = False) then
		begin
				if is_empty(qu)=1 then
				begin
				 	qu.front:=1;
				 	qu.rear :=1;
				 	qu.arr[qu.rear] := x;
				 	Enqueue :=qu;
				end 
				else
				begin
						qu.front := qu.front + 1;
						qu.arr[qu.front]:= x;
                        Enqueue :=qu;
				end;
		end
		else
		begin
			writeln('The Queue is is Full');
		end;
end;

function Dequeue(qu:Queue):Integer;
var v:Integer;
begin
	if is_empty(qu) = 1 then
        writeln('Nothing to pop the queue is empty')
    else
        begin
        	v := qu.arr[qu.rear];
        	qu.rear := qu.rear+1;
        end;
end;

function Lenght(qu:Queue): Integer;
begin
	writeln('Lenght = ',(qu.front-qu.rear));
end;

function First(qu:Queue): Integer;
begin
	if is_empty(qu)<>1 then
		writeln('First element = ',qu.arr[qu.rear]);
end;

function Last(qu:Queue):Integer;
begin
	if is_empty(qu) <> 1 then
		writeln('Last element = ',qu.arr[qu.front]);
end;

procedure display(qu:Queue);
var i:integer;
begin
	if is_empty(qu)=1 then
	 	writeln('Nothing to display the Queue is empty')
	else if(is_empty(qu) <> 1) then
	begin
		for i:=qu.rear to qu.front do
		begin
			write('[',qu.arr[i],']   ');
		end;
		writeln;
	end;
end;

function init(qu:Queue;size:Integer): Queue;
begin
	qu.max_size := size;
	qu.rear := 0;
	qu.front := 0;
	init := qu; 
end;

var 
q:Queue;
n:Integer;
begin
	q:=init(q,5);
	q:=Enqueue(q,3);
	q := Enqueue(q,4);
	q := Enqueue(q,5);
	display(q);
	Last(q);
	First(q);
	Lenght(q);
end.