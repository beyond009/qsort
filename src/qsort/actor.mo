import Array "mo:base/Array";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Stack "mo:base/Stack";
import Debug "mo:base/Debug";
import Option "mo:base/Option";
actor {
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
func _qsort(arr: [var Int]) : (){
    var st = Stack.Stack<Nat>();
    st.push(arr.size() - 1);
    st.push(0);
    while(not(st.isEmpty())) {
        var l:?Nat = st.pop();
        var r:?Nat = st.pop();
        var index:Nat = partition(arr,Option.unwrap(l),Option.unwrap(r)); 
        var ll:Nat =Option.unwrap(l);
        var rr:Nat = Option.unwrap(r);
        Debug.print("ll"#Nat.toText(ll)#" "#Nat.toText(rr)#" "#Nat.toText(index));
        if(ll + 1 < index) {
            st.push(index - 1);
            st.push(ll);
        };
        if(rr > index + 1) {
            st.push(rr);
            st.push(index + 1);
        };
    };

};
    public query func qsort(array : [Int]) : async [Int]{
        let res:[var Int] = Array.thaw(array);
        _qsort(res);
        Array.freeze<Int>(res)
    };
}