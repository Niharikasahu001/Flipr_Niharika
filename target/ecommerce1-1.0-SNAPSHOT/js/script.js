//let person = prompt("Please enter your name", "Harry Potter");
//
//if (person !== null) {
//  document.getElementById("demo").innerHTML =
//  "Hello " + person + "! How are you today?";
//}
//
//alert("HEllo everyone");
//alert("Heloo");

function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if (cart === null)
    {
        //no cart yet
        let products = [];
        let product = {
            productId: pid,
            productName: pname,
            productQuantity: 1,
            productPrice: price
        };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for the first time");

    } else
    {
        //cart is already present
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId = pid);
        if (oldProduct)
        {
            // we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased");
        } else
        {
            //we have to add the product
            let product = {
                productId: pid,
                productName: pname,
                productQuantity: 1,
                productPrice: price
            };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added");
        }
    }
    updateCart();
}

//Update cart:

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.lenght == 0)
    {
        console.log("Cart is empty!!")
        $(".cart-items").html("( 0 )");
        $(".card-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").addClass('disabled');
    } else
    {
        //there is something to show in a cart 
        console.log(cart);

        $(".cart-items").html(`(${cart.length})`);

        let table = `
                <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>


            `;

        let totalPrice = 0;
        cart.map((item) => {
            table +=
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.productQuantity}</td>
                        <td>${item.productQuantity * item.productPrice}</td>
                        <td><button class="btn btn-danger btn-sm">Remove</button></td>
                    </tr>

            totalPrice += item.productPrice * item.productQuantity;
        })

        table = table + `
        <tr><td colspan='5' class="text-right font-weight-bold m-5">Total Price : ${totalPrice}</td></tr>
        </table>`
        $(".card-body").html(table);

    }
}

$(document).ready(function ()
{
    updateCart();
})
