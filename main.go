package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	en := gin.Default()
	en.Use(gin.Recovery())
	en.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, "hello")
	})
	_ = en.Run()
}
