import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Nat32 "mo:base/Nat32";
import Int32 "mo:base/Int32";
import Stack "mo:base/Stack";
import Array "mo:base/Array";
import Option "mo:base/Option";
func partition(arr: [var Int],l : Nat,r : Nat): Nat{
    var point = arr[l];
    var ll :Nat= l;
    var rr :Nat= r;
         while(ll < rr) {
            while(ll < rr and arr[rr] >= point) {
           Debug.print("here"#Nat.toText(ll)#" "#Nat.toText(rr)#" "#Int.toText(point)#" "#Int.toText(arr[rr]));
                rr := rr- 1;
            };
            arr[ll] := arr[rr];
            while(ll < rr and arr[ll] <= point) {
                ll := ll + 1;
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
        var index:Nat = partition(arr,Nat32.toNat(Int32.toNat32(Option.unwrap(l))),Nat32.toNat(Int32.toNat32(Option.unwrap(r)))); 
        var ll:Int = Int32.toInt(Int32.fromNat32(Nat32.fromNat(Option.unwrap(l))));
        var rr:Int = Int32.toInt(Int32.fromNat32(Nat32.fromNat(Option.unwrap(r))));
        Debug.print("ll"#Int.toText(ll)#" "#Int.toText(rr)#" "#Nat.toText(index));
        if(ll < index - 1) {
            st.push(index - 1);
            st.push(ll);
        };
        if(rr > index + 1) {
            st.push(rr);
            st.push(index + 1);
        };
    };

};
let a : [var Int] = [var 1,2,3,9,8,7,6,5,4,3,2,1];
qsort(a);
var b = "";
for (i in a.vals()) {
    b := b # Int.toText(i) # ",";
};
Debug.print(b);
