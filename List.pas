program pass;
type
list = ^li;
    li = record
    data:integer;
    next:list;
end;

function is_empty(li:list):boolean;
begin
    if(li = nil) then
        is_empty:=True
    else
        is_empty:=False;
end;

function append(li:list;ele:integer):list;
var e:list;
begin
	new(e);
	if(e = nil) then
        writeln('error Occur on allocation memory')
    else
        begin
            e^.data := ele;
            new(e^.next) ;
            e^.next := nil;
            if(li = nil) then
                {here since in pascal we don't have the return function we are going to assign the result to the function'}
                append := e
            else
                e^.next := li;
                append := e
        end;
        {endif}
end;

procedure  display(li:list);
begin
	if(is_empty(li)) then 
        writeln('The list Is Empty')
    else
        while(li  <> nil) do
        begin 
            write('[',li^.data,']   ');
            li := li^.next;
        end;
        writeln;
        {endwhile}
    {endif}
end;
function pop(li:list):list;
var f:list;
begin
	if(is_empty(li)) then 
        writeln('The list is empty')
    else
        begin
        	f:=li;
        	li:=f^.next;
        	dispose(f);
        	pop:=li;
        end;
end;
function clear(li:list):list;
begin
	while(not is_empty(li)) do
	begin
        li:=pop(li);
    end;
    clear:=li;
end;

var 
e:list;
begin
	e := append(e,1);
	e := append(e,2);
	display(e);
	e:=clear(e);
	dispose(e);
	display(e);
end.