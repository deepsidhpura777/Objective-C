//
//  main.c
//  openglpractice
//
//  Created by Deep Sidhpura on 4/27/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#include <stdio.h>
#include <GLUT/GLUT.h>


struct Point{
    
    float x;
    float y;
};

int startx=0,starty=0,prex=0.1,prey=0.1;



void triangle(struct Point a,struct Point b,struct Point c,int m){
    
    if (m>0) {
        struct Point mid1,mid2,mid3;
        
        mid1.x=(a.x+b.x)/2;
        mid1.y=(a.y+b.y)/2;
        
        mid2.x=(a.x+c.x)/2;
        mid2.y=(a.y+c.y)/2;
        
        mid3.x=(b.x+c.x)/2;
        mid3.y=(b.y+c.y)/2;
        
        triangle(a, mid1, mid2, m-1);
        triangle(mid1, b, mid3, m-1);
        triangle(mid2, mid3, c, m-1);
        
    }
    else{
        
        glBegin(GL_TRIANGLES);
            glVertex2f(a.x,a.y);
            glVertex2f(b.x, b.y);
            glVertex2f(c.x,c.y);
        glEnd();
    }
    
}

void display(){
    
    struct Point x,y,z;
    
    x.x=100;
    x.y=100;
    
    y.x=500;
    y.y=100;
    
    z.x=250;
    z.y=300;
    
    //glClear(GL_COLOR_BUFFER_BIT);
    
   /* glBegin(GL_POINTS);
        glVertex2i(180, 280);
        glVertex2i(180, 350);
    glEnd();
    
    glBegin(GL_LINE);
        glVertex2i(180, 280);
        glVertex2i(400, 400);
    glEnd();
    
    glBegin(GL_TRIANGLES);
        glVertex2i(180, 280);
        glVertex2i(400, 400);
        glVertex2i(300, 300);
    glEnd();
    
    glBegin(GL_POLYGON);
        glVertex2i(400,400 );
        glVertex2i(600,600);
        glVertex2i(400, 600);
        glVertex2i(600, 400);
    glEnd();*/
    
    triangle(x, y, z, 4);
    
    glBegin(GL_LINES);
    
        glVertex2f(startx, starty);
        glVertex2f(prex, prey);
    
    glEnd();
    
}

void mouse(int button,int state,int x,int y){
    
    display();
    
    if(button==GLUT_LEFT_BUTTON && state==GLUT_DOWN){
        
        startx=prex;
        starty=prey;
        
        prex=x;
        prey=y;
        
    }
    
    display();
    
}


void init(){
    
    glClearColor(0, 0, 0, 0);
    glColor3i(1, 1, 1);
    glPointSize(4.0);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, 800, 0, 800);
}



int main(int argc, char ** argv)
{

    glutInit(&argc,argv);
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
    glutInitWindowSize(1000, 1000);
    glutInitWindowPosition(200, 200);
    glutCreateWindow("gasket");
    glutDisplayFunc(display);
    glutMouseFunc(mouse);
    init();
    glutMainLoop();
    
    
    
    return 0;
}

