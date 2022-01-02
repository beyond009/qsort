import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Stack "mo:base/Stack";
import Array "mo:base/Array";
import Option "mo:base/Option";
func partition(arr: [var Int],l : Nat,r : Nat): Nat{
    var point = arr[l];
    var ll :Nat= l;
    var rr :Nat= r;
    
         while(ll < rr) {
            while(ll < rr and arr[rr] >= point) {
                rr := rr- 1;
                Debug.print(Nat.toText(rr));
            };
            arr[ll] := arr[rr];
            while(ll < rr and arr[ll] <= point) {
                ll:= ll + 1;
            };
            arr[rr] := arr[ll];

        };
        arr[ll] := point;
        return ll;
};
func qsort(arr: [var Int]) : (){
    var st = Stack.Stack<Nat>();
    st.push(arr.size() - 1);
    st.push(0);
    while(not(st.isEmpty())) {
        var l:?Nat = st.pop();
        var r:?Nat = st.pop();
        var index:Nat = partition(arr,Option.unwrap(l),Option.unwrap(r)); 
        var ll:Nat = Option.unwrap(l);
        var rr:Nat = Option.unwrap(r);
        if(ll < index - ll) {
            st.push(index - ll);
            st.push(ll);
        };
        if(rr > index + ll) {
            st.push(rr);
            st.push(index + ll);
        };
    };

};
let a : [var Int] = [var 9,8,7,6,5,4,3,2,1];
qsort(a);
var b = "";
for (i in a.vals()) {
    b := b # Int.toText(i) # ",";
};
Debug.print(b);
