<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="ISO-8859-1">
        <title>User Registration</title>

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, #e0f7fa, #fce4ec);
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .form-container {
                background: #ffffff;
                width: 420px;
                padding: 40px 35px;
                border-radius: 18px;
                box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15);
                animation: fadeIn 0.7s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    transform: translateY(-20px);
                    opacity: 0;
                }

                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            h2 {
                text-align: center;
                margin-bottom: 25px;
                font-size: 26px;
                color: #2d3436;
                font-weight: 700;
            }

            label {
                font-size: 14px;
                font-weight: 600;
                color: #555;
                margin-bottom: 5px;
                display: block;
            }

            input,
            textarea {
                width: 100%;
                padding: 12px;
                border-radius: 10px;
                border: 1px solid #dfe6e9;
                font-size: 14px;
                background: #f7f9fc;
                transition: 0.3s ease;
            }

            input:focus,
            textarea:focus {
                background: #fff;
                border-color: #6c5ce7;
                box-shadow: 0 0 5px rgba(108, 92, 231, 0.4);
                outline: none;
            }

            .gender-group {
                margin: 12px 0;
            }

            .gender-group input {
                width: auto;
                margin: 0 6px 0 0;
            }

            /* PRO styled buttons */
            .submit-btn {
                width: 100%;
                padding: 12px;
                background: linear-gradient(90deg, #6c5ce7, #a29bfe);
                font-size: 16px;
                color: white;
                border: none;
                border-radius: 12px;
                margin-top: 10px;
                cursor: pointer;
                transition: 0.3s ease;
                font-weight: 600;
                letter-spacing: 0.5px;
            }

            .submit-btn:hover {
                background: linear-gradient(90deg, #a29bfe, #6c5ce7);
                transform: translateY(-2px);
                box-shadow: 0 8px 15px rgba(108, 92, 231, 0.4);
            }

            /* Login link styled like a button */
            .login-btn {
                display: block;
                text-align: center;
                margin-top: 18px;
                padding: 12px;
                border-radius: 10px;
                font-size: 14px;
                text-decoration: none;
                background: #ffeaa7;
                color: #2d3436;
                font-weight: 600;
                transition: 0.3s ease;
            }

            .login-btn:hover {
                background: #fab1a0;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 6px 12px rgba(250, 177, 160, 0.5);
            }

            /* Message Box (Error / Success) */
            .msg-box {
                width: 420px;
                padding: 12px;
                text-align: center;
                margin-bottom: 20px;
                border-radius: 10px;
                font-size: 15px;
                font-weight: 600;
                animation: fadeIn 0.4s ease;
            }

            .error {
                background: #ff7675;
                color: white;
                box-shadow: 0 4px 12px rgba(255, 118, 117, 0.4);
            }

            .success {
                background: #55efc4;
                color: #2d3436;
                box-shadow: 0 4px 12px rgba(85, 239, 196, 0.4);
            }
        </style>

    </head>

    <body>

        <% String msg=(String) request.getAttribute("msg"); %>

            <% if (msg !=null) { %>
                <div class="msg-box error">
                    <%= msg %>
                </div>
                <% } %>

                    <div class="form-container">
                        <h2>Create Account</h2>

                        <form action="save-user" method="post">

                            <label>Username</label>
                            <input type="text" name="username" required />

                            <label>Password</label>
                            <input type="password" name="password" required />

                            <label>Email</label>
                            <input type="email" name="gmail" required />

                            <div class="gender-group">
                                <label>Gender</label>
                                <input type="radio" name="gender" value="Male" required /> Male
                                <input type="radio" name="gender" value="Female" required /> Female
                            </div>

                            <label>Contact</label>
                            <input type="number" name="contact" required />

                            <label>Address</label>
                            <textarea name="address" rows="3" required></textarea>

                            <button type="submit" class="submit-btn">Submit</button>
                        </form>

                        <a href="login" class="login-btn">Already Have an Account? Login</a>
                    </div>

    </body>

    </html>